package com.li.service;

import com.li.entil.Dept;
import com.li.entil.Job;
import com.li.entil.User;
import org.junit.Test;

import java.util.List;

import static org.junit.Assert.*;

public class UserServiceTest {

    @Test
    public void checklogin() {
        JobService jobService = new JobService();
        List<Job> allDept = jobService.findAllJob();
        System.out.println(allDept);
    }
}