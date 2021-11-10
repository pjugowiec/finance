package com.server.admin.config.filter;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.server.admin.model.SecurityUserDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

import static com.server.admin.util.CommonValues.*;

@Component
public class AuthenticationHandler extends BasicAuthenticationFilter {

    @Autowired
    public AuthenticationHandler(AuthenticationManager authenticationManager) {
        super(authenticationManager);
    }

    @Override
    protected void onSuccessfulAuthentication(HttpServletRequest request, HttpServletResponse response, Authentication authResult) throws IOException {
        SecurityUserDetails principal = (SecurityUserDetails) authResult.getPrincipal();

        final String token = JWT.create()
                .withSubject(principal.getUsername())
                .withExpiresAt(new Date(System.currentTimeMillis() + EXPERIENCE_TIME))
                .sign(Algorithm.HMAC256(SECRET_KEY));
        response.addHeader(TOKEN_AUTHORIZATION, TOKEN_PREFIX + token);
    }
}
