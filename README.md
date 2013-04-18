# CoffeeScript.kdlecture
### An example implementation of a lecture for KodeLectures.kdapp

KodeLectures is an app that lives on Koding.com, allowing people to create and view lectures with interactive features. This repository is supposed to show how a lecture is strctured. 

## Structure

The current terminology for KodeLectures.kdapp is as follows:

- The basic unit is a `Course`. 
- Each `Course` can contain any number of `Lectures`
- A `Lecture` can contain a variety of things, such as embedded Media, files, assignments and so on.

### The Course

A course has a title, a description and the lectures it contains. It is the encapsulating unit for any number of lectures that the author wants to unite under a particular topic.

TODO: include course difficulty

### The Lecture

A lecture has a title and a plethora of values that contain media or text. Please check the `manifest.json` reference for further information.

## manifest.json

The main file of a Koding Lecture is the `manifest.json` file. You will find an example in this repository. Valid options are:

### Course level values

- `title`: The title of your Course, e.g. `How not to write production code`
- `description`: A short description of the Course, e.g. `This will teach you to avoid common mistakes when working with large codebases`
- `path`: Filename of the Course, in this very case it's `CoffeeScript.kdlecture`
- `lectures`: An array of objects, each representing a `Lecture` 
- `author`: Your name, as a string, e.g. `Frodo Baggins`

### Lecture level values
#### General Information
- `title`: The title of the Lecture. It is wise to enumerate the lectures here, e.g. 'Lecture 01: How to open a Text Editor'
- `summary`: A short text to show in the in-Lecture overview bar, e.g. 'Common mistakes when using git'

#### Origin Information
- `originType`: How the course can/should be impoorted, here it would be `git`.
- `originUrl`: The source where this course can be found.

####Text
- `codeHint`: This is a badly named text for the solution for the assignment. Use `markdown` here at your leisure.
- `codeHintText`: This text should give the user a clue how to solve the assignment. Use `markdown` here.
- `taskText`: The text containing instructions for finishing the assignment for this particular lecture. Again, `markdown` is supported.
- `lectureText`: The actual text of the lecture. Any explaining should be done here. `markdown` is supported.

#### Embedded Media
- `embedType`: If a video should be embedded into the lecture, specify a type.
  - Currently supported: `"youtube"`
- `videoUrl`: The URL that should be embedded. Make sure it is an embeddable URL. 

####Assignment-specific options
- `expectedResults`: This is highly experimental. Specify a String or an Object (w.i.p.) to test against for automatic assignment checking.
  - TODO: implement ruleset-support, implement regex support. 
- `submitSuccess`: Message to show to the user when the submitted code was correct
- `submitFailure`: Message to show to the user when the submitted code falls short of `expectedResults` checking         
- `language`: The programming language to be used in the editor.
  - Currently supported: `coffee`, `javascript`, `ruby`, `python`, basically anything the Ace editor supports.
- `code`: Code to show when the lesson starts. 
   - Please note: this is legacy logic, right now a file needs to be present in the `.kdlecture` directory. That file will then be loaded initially.

####Preview-related options
- `previewType`: WIP feature to use different preview types.
  - Currently supported: 
    - `code-preview` - Will execute the command in `execute` and return the result as a string
    - `execute-html` - Will show an `iframe` pointing to the file in `previewPath`, symlinked to the public koding webserver at a unique URL
    - `terminal` - Will show a koding WebTerm terminal and pass the input from the file into the terminal when code is submitted 
- `previewPath`: Used with the `execute-html` preview type
- `execute`: The command to be executed when the user submits his code, e.g. "coffee lecture01.coffee -n"
  - **WARNING**: this code will run inside the users virtual machine (for now). Please make sure not to go haywire and execute malicious commands.
  - as a note to users: until we have an approval process, treat every `.kdlecture` as potentially intrusive code. Please check the manifest.json file carefully!
- `files` : An array of files that belong to the lecture, e.g. `["lecture01.coffee"]`
  - for now, the first file will be shown. Further features are w.i.p.
   
