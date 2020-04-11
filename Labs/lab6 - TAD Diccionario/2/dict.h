#ifndef DICT_H
#define DICT_H

#include "../1/map.h"
#include <stdio.h>
#include <stdbool.h>
#include "../1/string.h"

typedef key_t wkey;
typedef value_t wdef;

/* Rename operations */
#define word_key_destroy key_destroy 
#define word_eq key_eq
#define word_less key_less 
#define word_dump key_dump 
#define word_value_destroy key_destroy
#define word_value_dump value_dump 

typedef struct _dict_t *dict_t;
/* dict_t is a pointer to a structure.
 * Note: The definition of the structure should be in [dict.c], not here.
 */

dict_t dict_empty();
/* Creates an empty dictionary
 *
 * PRE: {true}
 *
 *   dict = dict_empty();
 *
 * POS: {dict --> dict_t /\ dict_length(dict) == 0}
 */

dict_t dict_add(dict_t dict, string_t word, string_t def);
/* Adds a [word] and its definition [def] in the dictionary.
 * If [word] is already in the dictionary, its definition is replaced by [def].
 *
 * PRE: {dict --> dict_t /\ word --> string_t /\ def --> string_t}
 *
 *  dict = dict_add(dict, word, def);
 *
 * POS: {dict --> dict_t /\ string_eq(def, dict_search(dict, word))}
 */

string_t dict_search(dict_t dict, string_t word);
/* Returns the definition of the given [word], or NULL if [word] is not in
 * the dictionary.
 *
 * Note: Returns a reference to the string owned by the dictionary (not a copy).
 *
 * PRE: {dict --> dict_t /\ word --> string_t}
 *
 *   def = dict_search(dict, word);
 *
 * POS: {(def==NULL /\ !dict_exists(dict, word)) \/ def != NULL}
 */

bool dict_exists(dict_t dict, string_t word);
/* Returns true if the given word exists in the dictionary, and false
 * otherwise.
 *
 * PRE: {dict --> dict_t /\ word --> string_t}
 *
 *   b = dict_exists(dict, word);
 *
 * POS: {dict --> dict_t}
 */

unsigned int dict_length(dict_t dict);
/* Returns the number of words contained in the dictionary.
 * Complexity O(1)
 *
 * PRE: {dict --> dict_t}
 *
 *  n = dict_length(dict)
 *
 * POS: {dict --> dict_t /\ n >= 0}
 */

dict_t dict_remove(dict_t dict, string_t word);
/* Removes the given word from the dictionary. If
 * [word] is not in the dictionary, it does nothing and
 * returns the dict unchanged.
 *
 * PRE: {dict --> dict_t /\ word --> string_t}
 *
 *  dict = dict_remove(dict, word);
 *
 * POS: {dict --> dict_t /\ !dict_exists(dict, word)}
 *
 */

dict_t dict_remove_all(dict_t dict);
/* Removes all the words from the dictionary.
 *
 * PRE: {dict --> dict_t}
 *
 *  dict = dict_remove_all(dict);
 *
 * POS: {dict --> dict_t /\ dict_length(dict) == 0}
 */

void dict_dump(dict_t dict, FILE *file);
/* Prints all the words and its definitions in
 * the given file.
 *
 * Note: Use [dict_dump(dict, stdout)] to print in the screen.
 *
 * PRE: {dict --> dict_t /\ file != NULL}
 *
 *  dict = dict_dump(dict, file);
 *
 * POS: {dict --> dict_t}
 *
 */

dict_t dict_destroy(dict_t dict);
/* Destroys the given dictionary, freeing all the allocated resources.
 *
 * PRE: {dict --> dict_t}
 *
 *   dict = dict_destroy(dict);
 *
 * POS: {dict == NULL}
 */

#endif
