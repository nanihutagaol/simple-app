package nanihutagaol.simpleapp.service;

import nanihutagaol.simpleapp.exception.BookNotFoundException;
import nanihutagaol.simpleapp.model.Book;
import nanihutagaol.simpleapp.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class BookService {
    @Autowired
    private BookRepository bookRepository;

    public List<Book> getAllBooks() {
        return bookRepository.findAll();
    }

    public Book getBookById(Long bookId) {
        return bookRepository.findById(bookId)
                .orElseThrow(() -> new BookNotFoundException("Book not found."));
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public Book createBook(Book book) {
        final Book newBook = new Book();
        newBook.setTitle(book.getTitle());
        newBook.setAuthor(book.getAuthor());
        return bookRepository.save(newBook);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public void deleteBookById(Long bookId) {
        bookRepository.deleteById(bookId);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public Book updateBookById(Book book, Long bookId) {
        final Book updateBook = getBookById(bookId);
        updateBook.setTitle(book.getTitle());
        updateBook.setAuthor(book.getAuthor());
        return bookRepository.save(updateBook);
    }
}
