package mvc.service;

import mvc.domain.Li;
import mvc.domain.Player;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: jack
 * Date: 8/07/13
 * Time: 2:25 AM
 */
public interface GameService {
    public Player getPlayerByName(String name);
    public String createPlayer(Player player);
    public String editPlayer();
    public String deletePlayer();

    public List<Li> getLi();
}
