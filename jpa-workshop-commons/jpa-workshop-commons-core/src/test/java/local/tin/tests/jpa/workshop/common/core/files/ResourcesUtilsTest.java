package local.tin.tests.jpa.workshop.common.core.files;

import local.tin.tests.jpa.common.core.files.ResourcesUtils;
import local.tin.tests.jpa.common.core.files.ResourcesUtils;
import static org.hamcrest.CoreMatchers.equalTo;
import static org.junit.Assert.assertThat;
import org.junit.Test;

/**
 *
 * @author benitodarder
 */
public class ResourcesUtilsTest {
    
    @Test
    public void getFileAsString_from_resources_returns_the_file_content_as_string() throws Exception {
        
        String result = ResourcesUtils.getInstance().getFileAsString(ResourcesUtilsTest.class, "sample.properties");
        
        assertThat(result, equalTo("prop1=prop1" + System.lineSeparator() + "prop2=2"));
    }      
    
}
