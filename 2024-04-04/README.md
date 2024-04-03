# OCaml Manila: Building a Pokedex in OCaml

Welcome to the the inaugural OCaml Manila Meetup! Join us as we dive into OCaml to build a web-based Pokedex. This README is your guide to the project, providing information on how to get started, participate, and make the most of this meetup.

## Event Details

- **Date & Time**: The meetup starts at 7pm and will last for approximately 3 hours of coding, learning, and networking.
- **Venue**: Acceler8 Rockwell, 5F Phinma Plaza, 39 Plaza Drive, Rockwell Center, Makati City, Metro Manila.
- **Food**: Pizza will be provided! Please inform us of any dietary restrictions ahead of time.

## Preparation

Please ensure you have a working OCaml setup on your laptop before arriving. Installation instructions can be found at [OCaml's official installation guide](https://ocaml.org/install). If you encounter any issues, we'll be available to assist you at the event.

## The Project: Pokedex in OCaml

Our goal is to build a Pokedex web application using OCaml. This project is a fantastic opportunity to get started learning the basics of OCaml and explore the latest development in the OCaml Web ecosystem.

### Project Template

To get you started, we've provided a project template in the `./pokedex` directory. This template includes:

- A basic project structure with the build configuration.
- Dependencies we will use for the project:
  - [Dream](https://github.com/aantron/dream) for the web framework.
  - [Hyper](https://github.com/aantron/hyper) for the HTTP client.

Please clone this repository to access the project template and begin setting up your development environment.

#### Prerequisites

Ensure you have the latest version of opam, the OCaml package manager, installed on your system. If you're new to OCaml or opam, visit [OCaml's installation guide](https://ocaml.org/learn/tutorials/up_and_running.html) for detailed setup instructions.

#### Installing Dependencies

Once opam is set up, clone this repository to your local machine and navigate to the project directory. Run the following commands to install the project's dependencies:

```bash
opam install --deps-only --with-test --with-doc .
opam install ocaml-lsp-server odoc ocamlformat utop
```

These commands will install all necessary libraries and tools required for developing the Pokedex application, including:

- **ocaml-lsp-server**: For IDE integration and code intelligence.
- **odoc**: For generating documentation from OCaml code.
- **ocamlformat**: For automatically formatting your OCaml code according to a standard style.
- **utop**: An improved OCaml REPL for interactive programming.

#### Verifying the Installation

To verify that all dependencies are correctly installed, you can try running the project's build command:

```bash
dune build
```

If the build completes successfully, your development environment is set up and ready to go.

### Getting Started

With the setup complete, you're ready to start developing the Pokedex application. Here are a few pointers to get you started:

- **Running the Application**: To run the application and see your changes in action, use the command `dune exec ./src/main.exe`.
- **Using the Pokeapi**: Refer to the [Pokeapi documentation](https://pokeapi.co/docs/v2) to understand how to fetch and use Pokémon data in your application.
- **Dream and Hyper Documentation**: You can find the documentation for [Dream](https://ocaml.org/p/dream) and [Hyper](https://ocaml.org/p/hyper) on OCaml.org package documentation.

## Stay Connected

- **Discord**: Our [meetup Discord server](https://discord.gg/juTxX2XA) is the hub for communication and collaboration.
- **Feedback**: We value your feedback! Share your thoughts after the event to help us improve.

---

Happy hacking!
