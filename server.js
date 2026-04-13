import express from "express";
import { exec } from "child_process";

const app = express();
app.use(express.json());
app.use(express.static("public"));

app.post("/run", (req, res) => {
  const { cmd } = req.body;

  exec(cmd, (err, stdout, stderr) => {
    if (err) return res.send(stderr);
    res.send(stdout);
  });
});

app.listen(3000, () => console.log("Server ready"));
