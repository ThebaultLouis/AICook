<template>
  <div>
    <div class="q-ma-sm row text-center">
      <div class="col xs-12">
        <q-btn color="purple" icon="add" label="Ajouter une nouvelle recette" />
      </div>
    </div>
    <div class="q-pa-sm">
      <q-infinite-scroll @load="onLoad" :offset="250">
        <q-markup-table>
          <thead>
            <tr>
              <th class="text-left">Nom</th>
              <th class="text-right">Type</th>
              <th class="text-right">Nb personne</th>
              <th class="text-right">Difficulté</th>
              <th class="text-right">Temps total</th>
              <th class="text-right">Modifier</th>
              <th class="text-right">Supprimer</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="recipe in recipes" :key="recipe._id">
              <td class="text-left">{{recipe.name}}</td>
              <td class="text-right">{{recipe.type_recette}}</td>
              <td class="text-right">{{recipe.nb_personne}}</td>
              <td class="text-right">{{recipe.difficulty}}</td>
              <td class="text-right">{{recipe.temps_total}}</td>
              <td class="text-right">
                <q-btn
                  flat
                  round
                  color="amber"
                  icon="arrow_forward"
                  @click="$router.push({name: 'adminRecipesDetails', params: {
                  id: recipe._id
                }})"
                />
              </td>
              <td class="text-right">
                <q-btn flat round color="red" icon="clear" />
              </td>
            </tr>
          </tbody>
        </q-markup-table>
        <template v-slot:loading>
          <div class="row justify-center q-my-md">
            <q-spinner-dots color="primary" size="40px" />
          </div>
        </template>
      </q-infinite-scroll>
    </div>
    <!-- <div v-else>
      <q-spinner-gears color="primary" size="3rem" :thickness="5" />
    </div>-->
  </div>
</template>
<script>
import { mapState } from "vuex";

export default {
  mounted() {
    this.$store.dispatch("Admin/getRecipes", 0);
  },
  computed: mapState({
    loading: state => state.Admin.recipesLoading,
    recipes: state => state.Admin.recipes
  }),
  methods: {
    onLoad(index, done) {
      this.$store.dispatch("Admin/getNextRecipes");
      done();
    }
  }
};
</script>