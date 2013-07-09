package mvc.controller;

import com.google.gson.*;
import mvc.domain.Country;
import mvc.domain.Li;
import mvc.domain.Player;
import mvc.domain.helper.PlayerAttributeHelper;
import mvc.service.CountryService;
import mvc.service.GameService;
import mvc.util.DataTablesUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;


/**
 * Created with IntelliJ IDEA.
 * User: jack
 * Date: 25/05/13
 * Time: 10:47 PM
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class GameController {
    @Autowired
    private CountryService countryService;

    @Autowired
    private GameService gameService;

    @RequestMapping(value = "/fullCountryList.do", method = RequestMethod.GET)
    public ModelAndView displayFullCountryList(ModelMap model) {
        model.put("countryList", countryService.getCountry());
        return new ModelAndView("country_list", "model", model);
    }

    /*
    * direct to the server side fetching page
    * */
    @RequestMapping(value = "/gotoServerFetchingCountryList.do", method = RequestMethod.GET)
    public ModelAndView gotoServerFetchingCountryList(ModelMap model) {
        return new ModelAndView("server_fetching_country_list", "model", model);
    }

    /*
    * server side component to handle datatables server fetching ajax call
    * */
    @RequestMapping(value = "/serverFetchingCountryList.do", method = RequestMethod.GET)
    public
    @ResponseBody
    String serverFetchingCountryList(
            @RequestParam("iDisplayStart") Integer iDisplayStart,   // start from
            @RequestParam("iDisplayLength") Integer iDisplayLength, // number of entry
            @RequestParam("sEcho") String sEcho, // An integer value that is used by DataTables for synchronization purposes
            @RequestParam("iSortCol_0") Integer iSortCol_0, //The IDs of the columns used for ordering results
            @RequestParam("sSortDir_0") String sSortDir_0, //The sort direction for each of the columns used for ordering. If results are ordered by one column, an "asc" or "desc" value will be returned in the sSortDir_0 parameter
            @RequestParam("sSearch") String sSearch
    ) {
        System.out.println("++++++++++++++++++++++++++++++++++++++++++++===");
        System.out.println("iDisplayStart=" + iDisplayStart);
        System.out.println("iDisplayLength=" + iDisplayLength);

        List<Country> fullCountryList = countryService.getCountry();
        List<Country> filteredList = new ArrayList<Country>();
        // filter the result
        if (sSearch != null && !sSearch.isEmpty()) {
            for (Country c : fullCountryList) {
                if (DataTablesUtil.getValidStr(c.getCode()).toLowerCase().contains(sSearch.toLowerCase())
                        ||
                        DataTablesUtil.getValidStr(c.getDescription()).toLowerCase().contains(sSearch.toLowerCase())
                        ||
                        DataTablesUtil.getValidStr(c.getNationalityName()).toLowerCase().contains(sSearch.toLowerCase())) {
                    filteredList.add(c); // Add a company that matches search criterion
                }
            }
        } else {
            filteredList = fullCountryList;
        }


        //sort the result
        final int sortColumnIndex = iSortCol_0;
        final int sortDirection = sSortDir_0.equals("asc") ? -1 : 1;

        Collections.sort(filteredList, new Comparator<Country>() {
            @Override
            public int compare(Country c1, Country c2) {
                switch (sortColumnIndex) {
                    case 0:
                        if (c1.getId() != null && c2.getId() != null) {
                            return c1.getId().compareTo(c2.getId()) * sortDirection;
                        }

                    case 1:
                        if(c1.getCode()!=null&&c2.getCode()!=null){
                            return c1.getCode().compareTo(c2.getCode()) * sortDirection;
                        }

                    case 2:
                        if(c1.getDescription()!=null&&c2.getDescription()!=null){
                            return c1.getDescription().compareTo(c2.getDescription()) * sortDirection;
                        }

                    case 3:
                        if(c1.getNationalityName()!=null&&c2.getNationalityName()!=null){
                            return c1.getNationalityName().compareTo(c2.getNationalityName()) * sortDirection;
                        }
                }
                return 0;
            }
        });

        // pagination
        final int filteredListSize = filteredList.size();
        if (filteredListSize < iDisplayStart + iDisplayLength) {
            filteredList = filteredList.subList(iDisplayStart, filteredListSize);
        } else {
            filteredList = filteredList.subList(iDisplayStart, iDisplayStart + iDisplayLength);
        }

        // assemble entries into json string
        try {
            JsonObject jsonResponse = new JsonObject();

            jsonResponse.addProperty("sEcho", sEcho);
            jsonResponse.addProperty("iTotalRecords", fullCountryList.size());
            jsonResponse.addProperty("iTotalDisplayRecords", filteredListSize);

            JsonArray data = new JsonArray();
            for (Country c : filteredList) {
                JsonArray row = new JsonArray();
                row.add(new JsonPrimitive(c.getId()));
                row.add(new JsonPrimitive(DataTablesUtil.getValidStr(c.getCode())));
                row.add(new JsonPrimitive(DataTablesUtil.getValidStr(c.getDescription())));
                row.add(new JsonPrimitive(DataTablesUtil.getValidStr(c.getNationalityName())));
                data.add(row);
            }
            jsonResponse.add("aaData", data);
            System.out.println(data);
            return jsonResponse.toString();
        } catch (JsonIOException e) {
            e.printStackTrace();

        }

        return "";  //todo handle error
    }

    @RequestMapping(value = "/login.do", method = RequestMethod.GET)
    public String login(ModelMap model) {

        return "login";

    }

    @RequestMapping(value = "/loginfailed.do", method = RequestMethod.GET)
    public String loginerror(ModelMap model) {

        model.addAttribute("error", "true");
        return "login";

    }

    @RequestMapping(value = "/logout.do", method = RequestMethod.GET)
    public String logout(ModelMap model) {

        return "login";

    }

    @RequestMapping(value = "/createPlayer.do")
    public String createPlayer(Map model) {

        List<Li> ninjaLiList = gameService.getLi();

        List<PlayerAttributeHelper> attributeList=new LinkedList<PlayerAttributeHelper>();  // hardcoded
        attributeList.add(new PlayerAttributeHelper("power","力量"));
        attributeList.add(new PlayerAttributeHelper("speed","速度"));
        attributeList.add(new PlayerAttributeHelper("wisdom","智力"));
        attributeList.add(new PlayerAttributeHelper("blood","血气"));

        model.put("ninjaLiList",ninjaLiList); // ninja li list for user to choose from
        model.put("attributeList",attributeList); // attribute name list

        return "create_player";

    }

    @RequestMapping(value = "/persistPlayer.do", method = RequestMethod.POST)
    public ModelAndView persistPlayer(Map model,
                                      @RequestParam("name") String name,
                                      @RequestParam("h_power") Integer power,
                                      @RequestParam("h_speed") Integer speed,
                                      @RequestParam("h_wisdom") Integer wisdom,
                                      @RequestParam("h_blood") Integer blood,
                                      @RequestParam("selectedLiId") Integer li,
                                      @RequestParam("selectedSex") String sex
                                      ) {
        // check uniqueness of the name
        Player existingPlayerWithSameName=gameService.getPlayerByName(name);
        if(existingPlayerWithSameName!=null){
            System.out.println("name existing...");
            return null; //TODO return to a proper page
        }

        // TODO get li objects from cache
        List<Li> ninjaLiList = gameService.getLi();
        Li selectedLi=null;
        for(Li ninja_li:ninjaLiList){
            if(ninja_li.getLiId().equals(li)){
                selectedLi=ninja_li;
                System.out.println(ninja_li.getLiName());
            }
        }

        //
        Date current=new Date();
        Player player =new Player();
        player.setPlayerName(name);
        player.setSex(sex);
        player.setPower(power);
        player.setSpeed(speed);
        player.setWisdom(wisdom);
        player.setBlood(blood);
        player.setLi(selectedLi);
        player.setRegisterTime(current);
        player.setLastActiveTime(current);
        player.setExp(0l);
        player.setHp(100);
        player.setLevel(1);



        System.out.println("before create player..");
        System.out.println("gameService="+gameService);
        System.out.println("player="+player);
        String status=gameService.createPlayer(player);
        System.out.println("after create player "+status);


        return new ModelAndView("main", "model", model);

    }

    public CountryService getCountryService() {
        return countryService;
    }

    public void setCountryService(CountryService countryService) {
        this.countryService = countryService;
    }

    public GameService getGameService() {
        return gameService;
    }

    public void setGameService(GameService gameService) {
        this.gameService = gameService;
    }
}
