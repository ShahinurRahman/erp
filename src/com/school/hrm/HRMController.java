package com.school.hrm;


import com.school.hrm.model.Department;
import com.school.hrm.model.Designation;
import com.school.hrm.model.UserDetails;
import com.school.hrm.service.HRMService;
import com.iscool.security.model.AuthorizedGroups;
import com.iscool.security.model.Token;
import com.iscool.security.model.User;
import com.iscool.security.service.AuthenticationAndAuthorizationService;
import com.iscool.security.service.UserDetailsService;
import com.iscool.util.ERPConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/hrm/")
public class HRMController {
    @Autowired
    HRMService hrmService;
    @Autowired
    UserDetailsService userDetailsService;
    @Autowired
    AuthenticationAndAuthorizationService authorizationService;


    @RequestMapping(method = RequestMethod.GET, value = "/createDepartment.erp")
    public ModelAndView createDepartment() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "Create Department");
        map.put("DashboardLink", ERPConstants.DASHBOARD_LINK);

        return new ModelAndView("/hrm/department_create", map);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/saveDepartment.erp")
    public ModelAndView saveDepartment(@RequestParam("name") String name,
                                     @RequestParam("description") String description,
                                     @RequestParam("phoneNo") String phoneNo,
                                     @RequestParam("email") String email,
                                     @RequestParam("address") String address) {

        Department department = new Department();
        department.setName(name);
        department.setAddress(address);
        department.setDescription(description);
        department.setEmail(email);
        department.setPhone(phoneNo);
        hrmService.save(department);
        return new ModelAndView("redirect:/hrm/createDepartment.erp");
    }

    @RequestMapping(method = RequestMethod.GET, value = "/userDetailsList.erp")
    public ModelAndView userDetailsList() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "User Details");
        map.put("DashboardLink", ERPConstants.DASHBOARD_LINK);

        List<User>   users =  userDetailsService.getAllUsers();
        map.put("users", users);

        List<Designation> designationList = hrmService.findAllDesignation();
        map.put("designationList", designationList);

        List<Department> departmentList = hrmService.findAllDepartment();
        map.put("departmentList", departmentList);

        List<AuthorizedGroups> groups = authorizationService.findAllAuthorizedGroups();
        map.put("groups", groups);

        List<UserDetails> userDetailsList = hrmService.findAllUserDetails();
        map.put("userDetailsList", userDetailsList);
        return new ModelAndView("hrm/user_details", map);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/saveUserDetails.erp")
    public ModelAndView saveUserDetails(@RequestParam("tokenId") Long tokenId,
                                       @RequestParam("name") String name,
                                       @RequestParam("nickName") String nickName,
                                       @RequestParam("desiId") Long desiId,
                                       @RequestParam("dptId") Long dptId,
                                       @RequestParam("groupId") Long authorizedId,
                                       @RequestParam("officePhone") String officePhone,
                                       @RequestParam("cellPhone") String cellPhone,
                                       @RequestParam("workEmail") String workEmail,
                                       @RequestParam("personalEmail") String personalEmail,
                                       @RequestParam("webLink") String webLink) {
        Department department = hrmService.getDepartment(dptId);
        Designation designation = hrmService.getDesignation(desiId);
        AuthorizedGroups authorizedGroups = authorizationService.getAuthorizedGroups(authorizedId);
        Token token = userDetailsService.getToken(tokenId);

        UserDetails userDetails = new UserDetails();
        userDetails.setName(name);
        userDetails.setCellPhone(cellPhone);
        userDetails.setDepartment(department);
        userDetails.setDesignation(designation);
        userDetails.setNickName(nickName);
        userDetails.setOfficePhone(officePhone);
        userDetails.setWorkEmail(workEmail);
        userDetails.setWebLink(webLink);
        userDetails.setPersonalEmail(personalEmail);
        //TODO...
        //department.getUserDetailsList().add(userDetails);
        //designation.getUserDetailsList().add(userDetails);
        token.setUserDetails(userDetails);
        //token.getUser().getAuthorizedGroups().removeAll(token.getUser().getAuthorizedGroups());
        //token.getUser().getAuthorizedGroups().add(authorizedGroups);

        hrmService.save(userDetails);
        userDetailsService.update(token);
        return new ModelAndView("redirect:/hrm/userDetailsList.erp");
    }
    @RequestMapping(method = RequestMethod.GET, value = "/deleteUserDetails.erp")
    public ModelAndView deleteUserDetails(@RequestParam("id") Long id) {
        UserDetails userDetails = hrmService.getUserDetails(id);
        Token token = userDetails.getToken();
        token.setUserDetails(null);
        //TODO...  remove all relation
        hrmService.delete(userDetails);
        userDetailsService.update(token);
        return new ModelAndView("redirect:/hrm/userDetailsList.erp");
    }

    @RequestMapping(method = RequestMethod.GET, value = "/createDesignation.erp")
    public ModelAndView createDesignation() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "Create Designation");
        map.put("DashboardLink", ERPConstants.DASHBOARD_LINK);

        List<Designation> ds = hrmService.findAllDesignation();
        map.put("designationList", ds);

        return new ModelAndView("/hrm/designation", map);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/saveDesignation.erp")
    public ModelAndView saveDesignation(@RequestParam("name") String name,
                                        @RequestParam("description") String description) {
        Designation designation = new Designation();
        designation.setDescription(description);
        designation.setName(name);
        hrmService.save(designation);
        return new ModelAndView("redirect:/hrm/createDesignation.erp");
    }

    @RequestMapping(method = RequestMethod.POST, value = "/updateDesignation.erp")
    public ModelAndView updateDesignation(@RequestParam("id") Long id,
                                        @RequestParam("name") String name,
                                        @RequestParam("description") String description) {
        Designation designation = hrmService.getDesignation(id);
        designation.setDescription(description);
        designation.setName(name);
        hrmService.update(designation);
        return new ModelAndView("redirect:/hrm/createDesignation.erp");
    }
}
