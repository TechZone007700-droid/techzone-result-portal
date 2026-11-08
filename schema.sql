CREATE TABLE IF NOT EXISTS students (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  father_name TEXT NOT NULL,
  student_code TEXT NOT NULL UNIQUE,
  cnic TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS results (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  student_id INTEGER NOT NULL REFERENCES students(id) ON DELETE CASCADE,
  course TEXT NOT NULL,
  duration TEXT DEFAULT '',
  obtained_marks INTEGER NOT NULL CHECK(obtained_marks >= 0 AND obtained_marks <= 75),
  exam_date TEXT DEFAULT '',
  result_code TEXT DEFAULT '',
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX IF NOT EXISTS idx_students_lookup ON students(student_code, cnic);
CREATE INDEX IF NOT EXISTS idx_results_student ON results(student_id);