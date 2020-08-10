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

    @GetMapping("/titleN/{title}")
    public String index(@PathVariable String title) {
        return Book.getTitle(title);
    }

    @GetMapping
    public List<Book> getAllBooks() {
        return bookService.getAllBooks();
    }

    @GetMapping("/{bookId}")
    public Book getBookById(@PathVariable Long bookId) {
        return bookService.getBookById(bookId);
    }

    @PostMapping
    public Book createBook(@RequestBody Book book) {
        return bookService.createBook(book);
    }

}
