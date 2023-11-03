package com.oracle.S202350102.dao.mainDao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;

import com.oracle.S202350102.dto.User1;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class UserDaoImpl implements UserDao {
	private final SqlSession session;
	
	
	@Override
	public User1 userSelect(int user_num) {

			User1 user = new User1();
			try {
				System.out.println("user_id->"+user_num);
				user = session.selectOne("userSelect",user_num);
				System.out.println("user->"+user);
			} catch (Exception e) {
				System.out.println("UserDaoImpl userSelect exception->"+e.getMessage());
			}
			return user;
		}
	}
