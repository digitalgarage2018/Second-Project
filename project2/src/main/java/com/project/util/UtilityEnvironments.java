package com.project.util;

public class UtilityEnvironments {

    public enum ResponseState {
        NOCHANGE(0, "No action taken"),
        SUCCESS(1, "No errors found"),
        FAILURE(2, "An error has been found");

        private final int code;
        private final String description;

        private ResponseState(int code, String description) {
            this.code = code;
            this.description = description;
        }

        public String getDescription() {
            return description;
        }

        public int getCode() {
            return code;
        }

        @Override
        public String toString() {
            return code + ": " + description;
        }
    }

    public enum Types {
        STUDENT(0, "S"),
        PROFESSOR(1, "D");

        private final int code;
        private final String description;

        private Types(int code, String description) {
            this.code = code;
            this.description = description;
        }

        public String getDescription() {
            return description;
        }

        public int getCode() {
            return code;
        }

        @Override
        public String toString() {
            return code + ": " + description;
        }
    }
}
