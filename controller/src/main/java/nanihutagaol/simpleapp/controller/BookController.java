package nanihutagaol.simpleapp.controller;

import nanihutagaol.simpleapp.model.Book;
import nanihutagaol.simpleapp.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/books")
public class BookController {
    @Autowired
    private BookService bookService;

    @GetMapping
    public List<Book> getAllBooks() {
        return bookService.getAllBooks();
    }

    @PostMapping
    public Book createBook(@RequestBody Book book) {
        return bookService.createBook(book);
    }

    @DeleteMapping("/{bookId}")
    public void deleteBookById(@PathVariable Long bookId) {
        bookService.deleteBookById(bookId);
    }

    @PutMapping("/{bookId}")
    public Book updateBookById(@RequestBody Book book, @PathVariable Long bookId) {
        return bookService.updateBookById(book, bookId);
    }
}
