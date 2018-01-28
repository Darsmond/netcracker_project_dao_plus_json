import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.datasource.SimpleDriverDataSource;

public class App{

    private static final String url = "jdbc:postgresql://localhost/postgres";
    private static final String user = "postgres";
    private static final String password = "cisco";

    public Connection connect() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(url, user, password);
            System.out.println("Connected to the PostgreSQL server successfully.");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return conn;
    }

    public static void main(String[] args) throws SQLException, JsonProcessingException {
        App app = new App();
        app.connect();

        Connection conn = DriverManager.getConnection(url, user, password);
        PostgresGroupDao DaoFirst = new PostgresGroupDao(conn);

        Object object_test = DaoFirst.read(2);

        ObjectMapper mapper = new ObjectMapper();
        String jsonString = mapper.writeValueAsString(object_test);
        System.out.println("json " + jsonString);

        //Object g = DaoFirst.read(1);
        //System.out.print(g.getName());
    }
}