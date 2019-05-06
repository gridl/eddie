CREATE TRIGGER update_books_count_on_author
    AFTER CREATE ON books
    FOR EACH ROW
    EXECUTE PROCEDURE update_books_count();
