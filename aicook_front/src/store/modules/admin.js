import Axios from "axios";
import config from '../../config'

const apiUrl = process.env.API_URL;

export default {
  namespaced: true,
  state: {
    recipes: [],
    recipe: {},
    recipesPage: 0,
    recipesLoading: true,
    farms: [],
    farmsLoading: true,
    cities: [],
    deps: []
  },
  mutations: {
    setRecipes(state, recipes) {
      state.recipes = recipes
    },
    setRecipe(state, recipe) {
      state.recipe = recipe
    },
    pushRecipes(state, recipes) {
      state.recipes.push(...recipes)
    },
    incrRecipesPage(state) {
      state.recipesPage++
    },
    setRecipesLoading(state, load) {
      state.recipesLoading = load
    },
    isRecipesLoading(state) {
      return state.recipesLoading;
    },
    setFarms(state, farms) {
      state.farms = farms
    },
    setFarmsLoading(state, load) {
      state.farmsLoading = load
    },
    isFarmsLoading(state) {
      return state.farmsLoading;
    }
  },
  actions: {
    getRecipes({
      commit
    }, page) {
      commit('setRecipesLoading', true)
      Axios.get(config.API_URL + "recipes?page=" + page).then(res => {
        commit('setRecipes', res.data.recipes)
        commit('setRecipesLoading', false)
      }).catch(e => console.log(e))
    },
    getRecipeById({
      commit
    }, id) {
      commit('setRecipesLoading', true)
      Axios.get(config.API_URL + "recipes/" + id).then(res => {
        commit('setRecipe', res.data[0])
        commit('setRecipesLoading', false)
      }).catch(e => console.log(e))
    },
    getNextRecipes({
      commit,
      state
    }) {
      commit('setRecipesLoading', true)
      commit('incrRecipesPage')
      Axios.get(config.API_URL + "recipes?page=" + state.recipesPage).then(res => {
        commit('pushRecipes', res.data.recipes)
        commit('setRecipesLoading', false)
      }).catch(e => console.log(e))
    },
    getfarms({
      commit
    }) {
      commit('setFarmsLoading', true)
      Axios.get(config.API_URL + "farms/all").then(res => {
        commit('setFarms', res.data.farms)
        commit('setFarmsLoading', false)
      }).catch(e => console.log(e))
    },
  },
  getters: {

  },

}
