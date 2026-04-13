import express from "express";
import { exec } from "child_process";
import fs from "fs";

const app = express();
app.use(express.json());

// serve HTML
app.get("/", (req, res) => {
  res.sendFile(new URL("./index.html", import.meta.url).pathname);
});

// ⚠️ RUN ANY COMMAND
app.post("/run", (req, res) => {
  const { cmd } = req.body;

  console.log("CMD:", cmd);

  exec(cmd, { timeout: 10000 }, (err, stdout, stderr) => {
    if (err) return res.send(stderr || err.message);
    res.send(stdout || "✔️ Done");
  });
});

app.listen(3000, () => console.log("🚀 Server running on port 3000"));
