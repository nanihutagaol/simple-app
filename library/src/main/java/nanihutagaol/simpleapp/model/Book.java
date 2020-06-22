package nanihutagaol.simpleapp.model;

import javax.persistence.*;


@Entity
@Table(name = "book")
public class Book {
    @Id
    private long id;

    public static String getTitle(String title) {
        return "The title of the book is " + title;
    }
}
