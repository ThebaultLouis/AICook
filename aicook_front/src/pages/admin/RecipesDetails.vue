<template>
  <div class>
    <div>
      <q-img :src="recipe.image" :ratio="16/9" spinner-color="purple" spinner-size="82px">
        <q-btn
          class="absolute-top-right"
          flat
          color="white"
          icon="arrow_backward"
          @click="$router.go(-1)"
        />
        <!-- <div class="absolute-top-right">
          
        </div>-->
      </q-img>
    </div>
    <div>
      <h1 class="text-center text-h3">{{recipe.name}}</h1>
    </div>
    <div class="q-pa-sm">
      <div class="row items-center">
        <InfoItem name="Nombre de personne" :value="recipe.nb_personne" />
        <InfoItem name="Difficulté" :value="recipe.difficulty" />
        <InfoItem name="Temps préparation" :value="recipe.temps_prep" />
        <InfoItem name="Temps cuisson" :value="recipe.temps_cuisson" />
      </div>
      <div>
        <div class="text-h5 q-my-md">Ingrédients</div>
        <div v-for="ingredient in recipe.ingredients" :key="ingredient.name">
          <div class="row items-center">
            <div class="col-xs-1 text-center text-subtitle2">{{ingredient.value }}</div>
            <div class="col text-subtitle1">{{ ingredient.name }}</div>
          </div>
        </div>
      </div>
      <div>
        <div class="text-h5 q-my-md">Ingrédients</div>
        <div v-for="(etape, index) in recipe.etapes" :key="index">
          <div class="row items-start q-my-sm">
            <div class="col-xs-1 text-center q-pa-sm">
              <div class="q-pa-sm bg-amber text-white">{{index}}</div>
            </div>
            <div class="col q-pa-sm text-body1" v-html="etape"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { mapState } from "vuex";
import InfoItem from "../../components/admin/recipe/RecipeDetailsInfoItem";

export default {
  components: {
    InfoItem
  },
  mounted() {
    this.$store.dispatch("Admin/getRecipeById", this.$route.params.id);
  },
  computed: mapState({
    loading: state => state.Admin.recipesLoading,
    recipe: state => state.Admin.recipe
  })
};
</script>