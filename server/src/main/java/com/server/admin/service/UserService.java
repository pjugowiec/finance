package com.server.admin.service;

import com.server.admin.model.RegisterRequest;

public interface UserService {

    void create(final RegisterRequest registerRequest);
}
