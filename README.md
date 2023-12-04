# Flutter Animation App

This project involves the design and coding of a new Flutter app that simulates Android fragments. 
The app will display two widgets arranged horizontally, 
simulating a split-screen effect typically seen in tablet UIs or large-screen Android devices.

## Features

- **Dynamic UI**: At any point in time, the app will show two widgets arranged horizontally.
- **Animations List**: The widget on the left side displays a list of animations such as “bouncing ball”, “spinning wheel”, “rotating cube”, etc.
- **Interactive Selection**: Users can choose an animation from the list.
- **Animation Display**: Upon selection, the chosen animation is displayed in the right-side widget.

## Constraints & Functionalities

1. **Initial Display**: Upon app startup, the left-side widget (animations list) occupies the entire width of the screen.
2. **Selection and Layout Change**:
    - On selecting an animation, the width of the left-side widget is reduced to about 1/4 of the screen.
    - The selected item is highlighted.
    - The remaining 3/4 of the screen will display the selected animation in the right-side widget.
3. **Animation Requirements**:
    - At least 2 explicit animations.
    - At least 2 implicit animations.
    - A total of 6 animations in the app.
4. **Control Features for Explicit Animations**:
    - Buttons to pause and resume the animation.
    - Buttons to reverse the direction of the animation.
    - These controls are displayed in the right-side widget alongside the animation.

## Getting Started
Bouncing Ball Widget (bouncing_ball_widget.dart): Explicit Animation
Color Change Widget (color_change_widget.dart): Implicit Animation
Rotating Square Widget (rotating_square_widget.dart): Explicit Animation
Size Change Widget (size_change_widget.dart): Implicit Animation

## Contribution

Contributions are welcome. Please read the contribution guidelines before submitting pull requests.


## Acknowledgements

- Flutter Documentation
- Android Fragmentation Concept

---
