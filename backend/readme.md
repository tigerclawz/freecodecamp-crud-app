Since the json file cannot have comments because of potenmtial compilation risk, pasting the code here 
for future refernece


// backend/package.json
{
  "name": "crud-backend", // Name of the backend project
  "version": "1.0.0", // Version for tracking changes
  "scripts": {
    "start": "node index.js", // Runs the server
    "test": "echo 'Add tests here'", // Placeholder for tests (update with Jest later)
    "lint": "eslint ." // Checks code style with ESLint
  },
  "dependencies": {
    "express": "^4.17.1", // Web framework for API endpoints
    "pg": "^8.7.3" // PostgreSQL client to connect to the database
  },
  "devDependencies": {
    "eslint": "^8.0.0" // Linting tool for code quality
  }
}


// backend/index.js
const express = require('express'); // Import Express for building the API
const { Pool } = require('pg'); // Import PostgreSQL client
const app = express(); // Create an Express app
app.use(express.json()); // Parse JSON request bodies

// Connect to PostgreSQL using DATABASE_URL from environment variables
const pool = new Pool({ connectionString: process.env.DATABASE_URL });

// Health check endpoint for Kubernetes probes and monitoring
app.get('/healthz', (req, res) => res.json({ status: 'ok' }));

// Get all users from the database
app.get('/users', async (req, res) => {
  const { rows } = await pool.query('SELECT * FROM users'); // Query the users table
  res.json(rows); // Send users as JSON
});

// Add a new user to the database
app.post('/users', async (req, res) => {
  const { name } = req.body; // Get name from request body
  // Insert user and return the new record
  const { rows } = await pool.query('INSERT INTO users(name) VALUES($1) RETURNING *', [name]);
  res.json(rows[0]); // Send the new user as JSON
});

// Start the server on port 3000
app.listen(3000, () => console.log('Backend running on port 3000'));