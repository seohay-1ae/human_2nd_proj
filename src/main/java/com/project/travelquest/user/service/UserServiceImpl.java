package com.project.travelquest.user.service;

import com.project.travelquest.user.dao.UserDAO;
import com.project.travelquest.user.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("UserService")
@Transactional(propagation = Propagation.REQUIRED)
public class UserServiceImpl implements UserService{

    @Autowired
    UserDAO userDAO;

    @Override
    public List<UserVO> listUsers() throws Exception {
        List<UserVO> usersList = UserDAO.selectAllUsersList();
        return usersList;
    }
}
