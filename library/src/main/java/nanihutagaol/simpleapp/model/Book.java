package nanihutagaol.simpleapp.model;

import javax.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "book")
public class Book {
    @Id
    @GeneratedValue
    private long id;
    private String title;
    private String author;

    public static String getTitle(String title) {
        return "The title of the book is " + title;
    }
}
