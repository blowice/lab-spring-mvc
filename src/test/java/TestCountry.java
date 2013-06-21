import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonPrimitive;
import junit.framework.Assert;
import mvc.domain.Country;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;


/**
 * Created with IntelliJ IDEA.
 * User: jack
 * Date: 6/06/13
 * Time: 3:06 PM
 */

public class TestCountry {


    @Test
    public void testPagination(){

        List<String> alphaList=new ArrayList<String>();
        alphaList.add("a");
        alphaList.add("b");
        alphaList.add("c");
        alphaList.add("d");
        alphaList.add("e");
        alphaList.add("f");
        alphaList.add("g");
        alphaList.add("h");
        alphaList.add("i");
        alphaList.add("j");

        Assert.assertEquals("[a, b, c, d, e]",pagination(alphaList,0,5).toString());
        Assert.assertEquals("[a]",pagination(alphaList,0,1).toString());
        Assert.assertEquals("[b, c, d, e, f]",pagination(alphaList,1,5).toString());
        Assert.assertEquals("[d, e, f, g, h, i]",pagination(alphaList,3,6).toString());
        Assert.assertEquals("[j]",pagination(alphaList,9,1).toString());
    }

    private List<String> pagination(List<String> list, Integer iDisplayStart, Integer iDisplayLength){


        final int filteredListSize=list.size();
        if(filteredListSize< iDisplayStart + iDisplayLength) {
            list = list.subList(iDisplayStart, filteredListSize);
        } else {
            list = list.subList(iDisplayStart, iDisplayStart + iDisplayLength);
        }

        return list;
    }

    @Test
    public void testJson(){
        Country c=new Country();
        c.setCode("au");
        c.setNationalityName("Australia");
        Gson gson = new Gson();

        String json = gson.toJson(c);
        Assert.assertEquals("{\"code\":\"au\",\"nationalityName\":\"Australia\"}",json );

        JsonArray row = new JsonArray();
        row.add(new JsonPrimitive(c.getCode()));
        row.add(new JsonPrimitive(c.getNationalityName()));
        Assert.assertEquals("[\"au\",\"Australia\"]", row.toString());

        JsonArray data=new JsonArray();
        data.add(row);
        Assert.assertEquals("[[\"au\",\"Australia\"]]", data.toString());
    }


}
