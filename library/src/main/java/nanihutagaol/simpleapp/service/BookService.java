package nanihutagaol.simpleapp.service;

import nanihutagaol.simpleapp.model.Book;
import nanihutagaol.simpleapp.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookService {
    @Autowired
    @Lazy
    private BookRepository bookRepository;

    public List<Book> getAllBooks() {
        return bookRepository.findAll();
    }

    public Book getBookById(Long bookId) {
        return bookRepository.findById(bookId)
                .orElseThrow(() -> new RuntimeException("Book not found."));
    }

    public Book createBook(Book book) {
        return bookRepository.save(book);
    }
}
