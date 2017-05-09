package com.zhbit.user.service;

import com.zhbit.user.entity.TEmailuser;

public interface UserService {
	public void addEmailUser(TEmailuser user);
	public TEmailuser findByEmail(String signupEmail);
	public void updateEmailUser(TEmailuser user);
}
