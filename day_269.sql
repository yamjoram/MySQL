
Questions : Find the top 3 most common letters across all words in both google_file_store and google_word_lists tables (ignore the filename 
            column in google_file_store). Output the letter along with the number of occurrences, ordered in descending order by occurrences.


CREATE TABLE google_file_store (
contents VARCHAR(MAX),
filename VARCHAR(255) );
INSERT INTO google_file_store (contents, filename) VALUES
('This is a sample content with some words.', 'file1.txt'), ('Another file with more words and letters.', 'file2.txt'),
('Text for testing purposes with various characters.', 'file3.txt');
CREATE TABLE google_word_lists ( words1 VARCHAR(MAX),
words2 VARCHAR(MAX)
);
INSERT INTO google_word_lists (words1, words2) VALUES
('apple banana cherry', 'dog elephant fox'),
('grape honeydew kiwi', 'lemon mango nectarine'),
('orange papaya quince', 'raspberry strawberry tangerine');


-- Step 1: Combine all contents into one big string
WITH combined_texts AS (
  SELECT LOWER(contents) AS txt FROM google_file_store
  UNION ALL
  SELECT LOWER(words1) FROM google_word_lists
  UNION ALL
  SELECT LOWER(words2) FROM google_word_lists
),

-- Step 2: Merge all text into a single row
all_text AS (
  SELECT GROUP_CONCAT(txt SEPARATOR '') AS full_text
  FROM combined_texts
),

-- Step 3: Generate a sequence of numbers (1 to 1000 for safe measure)
seq AS (
  SELECT 1 AS n
  UNION ALL SELECT 2
  UNION ALL SELECT 3
  UNION ALL SELECT 4
  UNION ALL SELECT 5
  UNION ALL SELECT 6
  UNION ALL SELECT 7
  UNION ALL SELECT 8
  UNION ALL SELECT 9
  UNION ALL SELECT 10
  -- You can UNION ALL till 1000 if needed
),

-- Step 4: Extract each character
chars AS (
  SELECT SUBSTRING(full_text, n, 1) AS letter
  FROM all_text
  JOIN seq ON n <= CHAR_LENGTH(full_text)
)

-- Step 5: Final - Count letters
SELECT letter, COUNT(*) AS occurrences
FROM chars
WHERE letter REGEXP '[a-z]'
GROUP BY letter
ORDER BY occurrences DESC
LIMIT 3;

