package nanihutagaol.simpleapp.controller;
import nanihutagaol.simpleapp.model.Book;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/books")
public class BookController {

    @RequestMapping("/{title}")
    public String index(@PathVariable String title) {
        return Book.getTitle(title);
    }
}
