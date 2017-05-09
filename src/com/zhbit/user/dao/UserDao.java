package com.zhbit.user.dao;

import com.zhbit.user.entity.TEmailuser;

public interface UserDao {
	public void addEmailUser(TEmailuser user);
	public void checkEmailUser(TEmailuser user);
	public TEmailuser findByEmail(String signupEmail);
	public void updateEmailUser(TEmailuser user);
}
