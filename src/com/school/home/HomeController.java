package com.school.home;

import com.iscool.csd.service.CsdService;
import com.iscool.security.service.UserDetailsService;
import com.iscool.time.service.AttendanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;

@Controller
@RequestMapping("/")
public class HomeController {
    @Autowired
    CsdService csdService;
    @Autowired
    AttendanceService attendanceService;
    @Autowired
    UserDetailsService userDetailsService;

    @RequestMapping(method = RequestMethod.GET, value = "/home.erp")
    public ModelAndView home() {
        //Long empId = new CurrentUserCredentials().authorizeId;
        //Date dateAndTime = new Date();
        //User emp = userDetailsService.getUser(empId);
        HashMap<String, Object> map = new HashMap<String, Object>();
        /*
        List<AttendanceRegister> registers = attendanceService.getAttendanceRegisterList(dateAndTime, emp);

        if (registers.size()==0) {
            map.put("totalAttend", 0);
            AttendanceRegister register = new AttendanceRegister();
            register.setEmployee(emp);
            register.setDate(dateAndTime);
            register.setTimeIn(dateAndTime);
            register.setEntryType("Auto");
            register.setNote("");
            register.setApproved(true);
            emp.getRegisters().add(register);
            attendanceService.save(register);
        }else{
            map.put("totalAttend", registers.size());
        }
        map.put("appWaiting", 3);
        map.put("appToApprove", 2);
        map.put("onLeave", 1);

        //===================================
        map.put("PageTitle", "ERP - Home");
        map.put("PageLink", "home");
        map.put("templateType", "home");
        map.put("today", new TheDates().getToday());
        List<Customer> customers = csdService.findAllCustomer();
        int booking = 0;
        Double collectedAmount = 0.0;
        for(Customer customer : customers){
            booking++;
            collectedAmount += csdService.getTotalDeposit(customer);
        }
        map.put("numberOfBooking", booking);
        map.put("collectedAmount", collectedAmount);
        */
        map.put("PageTitle", "Home");
        return new ModelAndView("/home/index", map);

    }



}
