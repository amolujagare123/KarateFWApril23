package jobportal.jobportal;

import com.intuit.karate.junit5.Karate;

import static com.intuit.karate.junit5.Karate.run;

public class JobPortalRunner {

    @Karate.Test
    Karate runJobPortal()
    {
        return run("jobPortal").relativeTo(getClass());
    }
}
