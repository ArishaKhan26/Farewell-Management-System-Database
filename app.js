const express = require('express');
const mysql = require('mysql');
const app = express();

const bodyParser = require('body-parser');
app.use(bodyParser.json());


app.use(express.static('public'));

// Manual CORS Headers Configuration
app.use((req, res, next) => {
    // Specify the origin domains that you wish to allow for CORS
    res.setHeader('Access-Control-Allow-Origin', '*');  // Or instead of '*' you can specify domains like 'http://example.com'

    // Request methods you wish to allow
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');

    // Request headers you wish to allow
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');

    // Set to true if you need the website to include cookies in the requests sent
    // to the API (e.g. in case you use sessions)
    res.setHeader('Access-Control-Allow-Credentials', true);

    // Pass to next layer of middleware
    next();
});

app.use(express.json()); // Middleware to parse JSON

// MySQL connection setup
const connection = mysql.createConnection({
    host: 'localhost', // or your host, e.g., 'database.example.com'
    user: 'root',
    password: 'Arrijfawad2002',  // Note: It's generally unsafe to hard-code sensitive information directly in your source code.
    database: 'FARWELL'
});

connection.connect(err => {
    if (err) throw err;
    console.log('Connected to the MySQL server.');
});


// Node.js/Express server side
app.post('/api/register', (req, res) => {
    const { login, password } = req.body;
    if (!login || !password) {
        return res.status(400).send('Email and password are required.');
    }

    // Assuming you have a function setup to handle the database insertion
    const query = 'INSERT INTO user (login, password) VALUES (?, ?)';
    connection.query(query, [login, password], (err, results) => {
        if (err) {
            console.error('Failed to insert into database:', err);
            return res.status(500).send('Error saving user.');
        }
        res.send('User registered successfully.');
    });
});


// API endpoint to register an attendee
app.post('/api/registerAttendee', (req, res) => {
    const { name, contactNumber, familyCount } = req.body;
    const sql = 'INSERT INTO attendee (name, contact_number, family_count) VALUES (?, ?, ?)';
    connection.query(sql, [name, contactNumber, familyCount], (error, results, fields) => {
        if (error) {
            console.log(error);
            res.status(500).send('Error registering attendee');
        } else {
            res.send({ success: true, message: 'Attendee registered successfully' });
        }
    });
});


// API endpoint to get menu items
app.get('/api/menu', (req, res) => {
    connection.query('SELECT * FROM menu', (error, results, fields) => {
        if (error) throw error;
        res.json(results);
    });
});

// Your endpoint
app.post('/api/processVotes', (req, res) => {
    const { votedItems } = req.body;  // Array of item numbers

    // Assuming a fixed distribution logic: first 3 items go to Turkish, next 3 to Continental, etc.
    const typeMapping = ['turkish', 'continental', 'chinese', 'fast_food', 'afghani'];
    let typeVotes = {turkish: 0, continental: 0, chinese: 0, fast_food: 0, afghani: 0};

    // Map each vote to a type
    votedItems.forEach((item, index) => {
        const typeIndex = Math.floor(index / 3) % typeMapping.length; // Cycle through types every 3 items
        typeVotes[typeMapping[typeIndex]]++;
    });

    // Insert query to add a new row in the voting table
    const sql = `INSERT INTO voting (turkish, continental, chinese, fast_food, afghani) VALUES (?, ?, ?, ?, ?)`;

    connection.query(sql, [typeVotes.turkish, typeVotes.continental, typeVotes.chinese, typeVotes.fast_food, typeVotes.afghani], (err, result) => {
        if (err) {
            console.error('Failed to insert votes:', err);
            return res.status(500).send({ success: false, message: 'Database error', error: err });
        }
        res.send({ success: true, message: "Votes successfully processed", data: typeVotes });
    });
});

// Fetch organizer's role based on ID
app.post('/api/check-organizer', (req, res) => {
    const { id } = req.body;
    if (!id) {
        return res.status(400).send({ success: false, message: 'Organizer ID is required' });
    }
    const query = 'SELECT role FROM organizer WHERE id = ?';
    connection.query(query, [id], (err, results) => {
        if (err) {
            console.error('Database error:', err);
            return res.status(500).send({ success: false, message: 'Database error', error: err });
        }
        if (results.length > 0) {
            const role = results[0].role;
            res.send({ success: true, role: role });
        } else {
            res.status(404).send({ success: false, message: 'Organizer not found' });
        }
    });
});



app.get('/api/tasks/:organizerId', (req, res) => {
    const organizerId = req.params.organizerId;
    const sql = 'SELECT * FROM task WHERE organizer_id = ?';

    connection.query(sql, [organizerId], (err, results) => {
        if (err) {
            return res.status(500).send({ success: false, message: 'Database error', error: err });
        }
        if (results.length > 0) {
            res.send(results);  // Send tasks specific to the organizer ID
        } else {
            // If no tasks found for this organizer, send all tasks
            connection.query('SELECT * FROM task', (err, allResults) => {
                if (err) {
                    return res.status(500).send({ success: false, message: 'Database error when fetching all tasks', error: err });
                }
                res.send(allResults);  // Send all tasks if no specific tasks were found
            });
        }
    });
});




const port = 3000;
app.listen(port, () => {
    console.log(`Server running on port ${port}`);
});
