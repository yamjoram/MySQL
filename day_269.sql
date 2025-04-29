
Questions : Find the  common letters across all words in both google_file_store and google_word_lists tables (ignore the filename 
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


-- Step 1: Combine all text into one long string, remove spaces, punctuation
WITH combined_text AS (
  SELECT LOWER(contents) AS txt FROM google_file_store
  UNION ALL
  SELECT LOWER(words1) FROM google_word_lists
  UNION ALL
  SELECT LOWER(words2) FROM google_word_lists
),

cleaned_text AS (
  SELECT REPLACE(
           REGEXP_REPLACE(GROUP_CONCAT(txt SEPARATOR ''), '[^a-z]', ''), 
           ' ', ''
         ) AS full_text
  FROM combined_text
),

-- Step 2: Generate a sequence from 1 to 1000 (adjust if needed)
seq AS (
  SELECT 1 AS n
  UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5
  UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9
  UNION ALL SELECT 10 UNION ALL SELECT 11 UNION ALL SELECT 12 UNION ALL SELECT 13
  UNION ALL SELECT 14 UNION ALL SELECT 15 UNION ALL SELECT 16 UNION ALL SELECT 17
  UNION ALL SELECT 18 UNION ALL SELECT 19 UNION ALL SELECT 20 -- extend if needed
),

-- Step 3: Extract individual characters
letters AS (
  SELECT SUBSTRING(full_text, n, 1) AS letter
  FROM cleaned_text, seq
  WHERE n <= CHAR_LENGTH(full_text)
)

-- Step 4: Count letters
SELECT letter, COUNT(*) AS occurrences
FROM letters
GROUP BY letter
ORDER BY occurrences DESC;
