const express = require("express");
const mysql = require("mysql2");
const multer = require("multer");
const cors = require("cors");
const path = require("path");
const fs = require("fs");

const app = express();
const port = 3000;

// Enable CORS
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Ensure uploads directory exists
const uploadDir = path.join(__dirname, "uploads");
if (!fs.existsSync(uploadDir)) {
  fs.mkdirSync(uploadDir);
}

// Set up MySQL connection
const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "", // Replace with your password
  database: "fbpost",
});

db.connect((err) => {
  if (err) {
    console.error("Database connection failed:", err.message);
    return;
  }
  console.log("Connected to MySQL database.");

  // Create table if it doesn't exist
  const createTableQuery = `
    CREATE TABLE IF NOT EXISTS posts (
      id INT AUTO_INCREMENT PRIMARY KEY,
      image VARCHAR(255),
      subtext TEXT,
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
  `;
  db.query(createTableQuery, (err) => {
    if (err) console.error("Error creating table:", err.message);
  });
});

// Set up Multer for file upload
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "uploads/");
  },
  filename: (req, file, cb) => {
    const uniqueName = `${Date.now()}${path.extname(file.originalname)}`;
    cb(null, uniqueName);
  },
});
const upload = multer({ storage });

// Upload API: POST /api/posts
app.post("/api/posts", upload.single("image"), (req, res) => {
  const { subtext } = req.body;
  const image = req.file ? req.file.filename : null;

  const query = "INSERT INTO posts (image, subtext) VALUES (?, ?)";
  db.query(query, [image, subtext], (err, result) => {
    if (err) {
      console.error("Insert error:", err.message);
      return res.status(500).json({ message: "Error posting the image." });
    }
    res.status(201).json({ message: "Post created successfully!" });
  });
});

// Fetch API: GET /api/posts
app.get("/api/posts", (req, res) => {
  const query = "SELECT * FROM posts ORDER BY created_at DESC";
  db.query(query, (err, results) => {
    if (err) {
      console.error("Select error:", err.message);
      return res.status(500).json({ message: "Error retrieving posts." });
    }
    res.status(200).json(results);
  });
});

// Serve uploaded images statically
app.use("/uploads", express.static(path.join(__dirname, "uploads")));

// Start server
app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
