CREATE TABLE Books(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    label_id INT,
    genre_id INT,
    author_id INT,
    publish_date DATE,
    archived BOOLEAN,
    FOREIGN KEY(label_id) REFERENCES label(id);
    FOREIGN KEY(genre_id) REFERENCES genre(id),
    FOREIGN KEY(author_id) REFERENCES author(id),
);

CREATE TABLE Labels(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR(255),
    color VARCHAR(255),
);
