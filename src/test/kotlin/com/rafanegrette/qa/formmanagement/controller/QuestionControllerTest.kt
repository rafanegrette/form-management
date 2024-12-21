package com.rafanegrette.qa.formmanagement.controller

import com.fasterxml.jackson.databind.ObjectMapper
import com.rafanegrette.qa.formmanagement.model.Question
import org.junit.jupiter.api.Test
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest
import org.springframework.http.MediaType
import org.springframework.test.web.servlet.MockMvc
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post
import org.springframework.test.web.servlet.result.MockMvcResultMatchers.status

@WebMvcTest
class QuestionControllerTest {

    @Autowired
    private lateinit var mockMvc: MockMvc

    @Autowired
    private lateinit var objectMapper: ObjectMapper

    @Test
    fun `should create a new question`() {
        val question = Question(
            text = "What is Java?",
            description = "Explain what Java is and its main features",
            category = "Programming"
        )

        mockMvc.perform(
            post("/questions")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(question)))
            .andExpect(status().isCreated)

    }
}