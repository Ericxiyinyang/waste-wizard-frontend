"""
Eric
Feb 28, 2024
OMH
"""

# Import JSON to work with JSON label file
import json

# Load in the JSON file for original annotations
input_annotations = json.load(open('COREMLTRANS/batch_1/annotations.json'))
output_annotations = []

# Create a dictionary to map image IDs to file names
images = input_annotations['images']
image_dict = {}
for image in images:
  image_dict[image['id']] = image['file_name']

# Loop through the annotations and create a new dictionary for each annotation
for annotation in input_annotations['annotations']:
  coords_dict = {}
  # Calculate the center x and y coordinates, and the width and height of the bounding box
  coords_dict['x'] = annotation['bbox'][0] + annotation['bbox'][2]/2
  coords_dict['y'] = annotation['bbox'][1] + annotation['bbox'][3]/2
  coords_dict['width'] = annotation['bbox'][2]
  coords_dict['height'] = annotation['bbox'][3]
  cur_dict = {}
  cur_dict['annotation'] = [{'coordinates': coords_dict, 'label': annotation['category_id']}]
  cur_dict['imagefilename'] = image_dict[annotation['image_id']]
  # Append the new dictionary to the output_annotations list
  output_annotations.append(cur_dict)

# Save the new annotations to a JSON file
with open('COREMLTRANS/batch_1/annotations.createml.json', 'w') as f:
  json.dump(output_annotations, f)