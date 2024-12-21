package com.rafanegrette.qa.formmanagement.controller

import com.rafanegrette.qa.formmanagement.model.Question
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("questions")
class QuestionController {

    @PostMapping
    fun create(@RequestBody question : Question) : ResponseEntity<Void> {

        return ResponseEntity.status(HttpStatus.CREATED).build()
    }
}