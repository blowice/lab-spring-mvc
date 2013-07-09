package mvc.domain.helper;

/**
 * Created with IntelliJ IDEA.
 * User: jack
 * Date: 8/07/13
 * Time: 10:21 PM
 */
public class PlayerAttributeHelper {
    private String attributeName;
    private String attributeDisplayText;

    public PlayerAttributeHelper(String attributeName, String attributeDisplayText) {
        this.attributeName = attributeName;
        this.attributeDisplayText = attributeDisplayText;
    }

    public String getAttributeName() {
        return attributeName;
    }

    public void setAttributeName(String attributeName) {
        this.attributeName = attributeName;
    }

    public String getAttributeDisplayText() {
        return attributeDisplayText;
    }

    public void setAttributeDisplayText(String attributeDisplayText) {
        this.attributeDisplayText = attributeDisplayText;
    }
}
