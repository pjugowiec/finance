package com.server.admin.model;

public record ChangePasswordRequest(String email, String newPassword) {
}
