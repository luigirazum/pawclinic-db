<a name="readme-top"></a>

<div align="center">

  <img src="https://www.svgrepo.com/download/397723/paw-prints.svg" alt="logo" width="100" height="auto" />
  <br/>

### Paw Clinic
is a relational database based on a real-life example which creates the data structure for a vet clinic.

</div>

# 📗 Table of Contents

- [🐾 Paw Clinic](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
- [💻 Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Setup](#setup)
  - [Run](#run)
  - [Usage](#usage)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

<div align="center"><hr width="250px"/></div>

# 🐾 Paw Clinic <a name="about-project"></a>

**Paw Clinic** is a relational database based on a real-life example which creates the data structure for a vet clinic. It starts with one table, and step by step, you will create a complete database with data about:
- animals
- animals' owners
- clinic employees
- visits

Apart from building data structure, it challenges you with tasks that require SQL queries to answer specific questions.

- ## 📈 Entity Relationship Diagram <a name="built-with"></a>
  ERD was made with [**draw**SQL](https://drawsql.app/).

  <img src="drawSQL-vet_clinic-db.svg">
  
## 🛠 Built With <a name="built-with"></a>

- ### Tech Stack <a name="tech-stack"></a>

  <ul>
    <li>
      <a href="https://www.postgresql.org/">
      <img align="center" width="25px" src="https://wiki.postgresql.org/images/3/30/PostgreSQL_logo.3colors.120x120.png" alt="postgreSQL logo" />
      PostgreSQL
      </a>
    </li>
    <li>
      <a href="https://drawsql.app/">
      <img align="center" width="25px" src="https://first.drawsql.app/assets/images/image01.png?v=53d6933e" alt="postgreSQL logo" />
      <b>draw</b>SQL
      </a>
    </li>
  </ul>

<!-- Features -->

- ### Key Features <a name="key-features"></a>

<details>
  <summary>

  #### 1️⃣ Create `animals` table.
  </summary>
  
  - Create Database `vet_clinic`.
  - Add Table `animals`.
  - Add demo Data to `animals` table.
  - Use of SQL queries to consult data.

</details>

<details>
  <summary>
  
  #### 2️⃣ Query and update `animals` table.
  </summary>

  - Modify `animals` table.
  - Add more dummy Data to 'animals' table.
  - Use transactions to update and delete records.
  - Use `ROLLBACK` and `SAVEPOINT` to restore the database to a previous state.
  - Use aggregate functions and `GROUP BY` to answer analytical questions.
</details>

<details>
  <summary>
  
  #### 3️⃣ Query multiple tables.
  </summary>

  - Use primary key & foreign key mechanism for joining tables.
    - Add new `owners` and `species` tables and,
    - Add foreign key columns to your existing `animals` table to model one-to-many relationships.
  - Insert data to `owners` and `species` tables.
  - Query multiple tables.
    - Afterward, use `JOIN` to query the data.
  - Prepare complex queries that answer analytical questions.
    - What animals belong to Melody Pond?
    - List of all animals that are pokemon (their type is Pokemon).
    - List all owners and their animals, remember to include those that don't own any animal.
    - How many animals are there per species?
    - List all Digimon owned by Jennifer Orwell.
    - List all animals owned by Dean Winchester that haven't tried to escape.
    - Who owns the most animals?
</details>

<details>
  <summary>

   #### 4️⃣ Add many-to-many `JOIN` tables.
  </summary>

  - Create a table named `vets`.
  - Create a "join table" called `specializations` to handle a **many-to-many** relationship between the tables `species` and `vets`.
  - Create a "join table" called `visits` to handle a **many-to-many** relationship between the tables `animals` and `vets`.
  - Insert data for `vets`.
  - Insert data for `specialties`.
  - Insert data for `visits`.
  - Write more complex queries to use them to answer questions.
    - Who was the last animal seen by William Tatcher?
    - How many different animals did Stephanie Mendez see?
    - List all vets and their specialties, including vets with no specialties.
    - List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
    - What animal has the most visits to vets?
    - Who was Maisy Smith's first visit?
    - Details for most recent visit: animal information, vet information, and date of visit.
    - How many visits were with a vet that did not specialize in that animal's species?
    - What specialty should Maisy Smith consider getting? Look for the species she gets the most.
</details>

<details>
  <summary>
  
  #### 5️⃣ Add ERD (Entity Relationship Diagram).
  </summary>

  - Create ERD on [**draw**SQL](https://drawsql.app/).
  - Export the ERD to `png` image.
  - Convert `png` to `svg` image.
  - Upload the ERD image to this repo.
  - Add the ERD image to this `README`.
</details>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LIVE DEMO

## 🚀 Live Demo <a name="live-demo"></a>

> Add a link to your deployed project.

- [Live Demo Link](<replace-with-your-deployment-URL>)

<p align="right">(<a href="#readme-top">back to top</a>)</p>
-->
<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy of this project up and running, follow these steps.

- ### Prerequisites

   - In order to run this project locally you need `git` installed. Please got to [Getting Started - Installing Git guide](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and follow the steps described for your system to install `git`.
   - Also you must have `PostgreSQL` installed, you can follow the [PostgreSQL Tutorial](https://www.postgresqltutorial.com/) and follow the steps for your computer OS.


- ### Setup
    Clone this repository to your desired folder:
    ```sh
    cd my-folder
    git clone git@github.com:luigirazum/pawclinic-db.git
    cd pawclinic-db
    ```
- ### Run
    Start your `PostgreSQL` CLI:
    ```sh
    psql postgres
    ```
    `PostgreSQL` will show the `prompt`:
    ```postgresql
    postgres=#
    ```
    Now you can start typing `SQL` sentences. Happy querying!✌️
- ### Usage
  This repository includes files with plain SQL that can be used to recreate a database:
  - Use [schema.sql](./schema.sql) to create all tables.
    ```sql
    CREATE DATABASE vet_clinic;
    ```
    ```sql
    CREATE TABLE animals (
      id INT GENERATED ALWAYS AS IDENTITY,
      name VARCHAR(50),
      date_of_birth DATE,
      escape_attempts INT,
      neutered BOOLEAN,
      weight_kg DECIMAL,
      PRIMARY KEY(id)
    );
    ```
  - Use [data.sql](./data.sql) to populate tables with sample data.
    ```sql
    INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
      VALUES ('Agumon', '02/03/2020', 0, true, 10.23);
    ```
  - Check [queries.sql](./queries.sql) for examples of queries that can be run on a newly created database.
    ```sql
    SELECT * from animals WHERE name LIKE '%mon';
    ```
    ⚠️ _*Important note: this file might include queries that make changes in the database (e.g., remove records). Use them responsibly!*_

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Author(s) <a name="authors"></a>

👨‍💻 **Luis Zubia**

<ul>
  <li>
      <a href="https://github.com/luigirazum">
      <img align="center" width="20px" src="https://upload.wikimedia.org/wikipedia/commons/2/24/Github_logo_svg.svg" alt="github logo" />
      Github: <b>@luigirazum</b>
      </a>
    </li>
    <li>
      <a href="https://twitter.com/LuigiRazum">
      <img align="center" width="20px" src="https://upload.wikimedia.org/wikipedia/commons/6/6f/Logo_of_Twitter.svg" alt="twitter logo" />
      Twitter: <b>@LuigiRazum</b>
      </a>
    </li>
    <li>
      <a href="https://linkedin.com/in/luiszubia">
      <img align="center" width="20px" src="https://upload.wikimedia.org/wikipedia/commons/c/ca/LinkedIn_logo_initials.png" alt="linkedin logo" />
      LinkedIn: <b>Luis Zubia</b>
      </a>
    </li>
</ul>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- Add more dummy data to test the database.
- Add sample queries to show how the database works.
- Add the Entity Relationship Diagram (ERD).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, typos, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project, your support giving a ⭐ will be highly appreciated.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

- 🐾 I would like to thank for all those pets that inspired me to name this project.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FAQ (optional)

## ❓ FAQ <a name="faq"></a>

> Add at least 2 questions new developers would ask when they decide to use your project.

- **[Question_1]**

  - [Answer_1]

- **[Question_2]**

  - [Answer_2]

<p align="right">(<a href="#readme-top">back to top</a>)</p>
-->
<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
