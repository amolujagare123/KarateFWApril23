package SampleUser;

import com.intuit.karate.junit5.Karate;

import static com.intuit.karate.junit5.Karate.run;

public class SampleUserRunner {


    @Karate.Test
    Karate sampleUserRunner()
    {
       // return  run("src/test/java/SampleUser/SampleUser.JobPortalRunner");
        return  run("SampleUser")
                .relativeTo(getClass())
                .tags("@UpdateUser");
    }


}
