import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PostgresGroupDao implements GroupDao {

    private final Connection connection;

    @Override
    public Object create() {
        return null;
    }

    @Override
    public Object read(int key) throws SQLException {
        String sql = "SELECT * FROM objects WHERE object_id = ?;";
        PreparedStatement stm = connection.prepareStatement(sql);

        stm.setInt(1, key);

        ResultSet rs = stm.executeQuery();
        rs.next();
        Object g = new Object();
        g.setId(rs.getInt("object_id"));
        g.setName(rs.getString("name"));
        return g;
    }

    @Override
    public void update(Object group) {

    }

    @Override
    public void delete(Object group) {

    }

    public PostgresGroupDao(Connection connection) {
        this.connection = connection;
    }
}