package mvc.dao;

import mvc.domain.Li;
import mvc.domain.Player;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: jack
 * Date: 8/07/13
 * Time: 1:41 AM
 */
public interface GameDao {
    public Player getPlayer(String name);
    public String createPlayer(Player player);
    public String editPlayer();
    public String deletePlayer();

    public List<Li> getLi();

}
