# Magic 8 Ball
## Introduction

Magic 8 Ball is a demo of basic UI functionality.

### Table of contents
 [Functionaility](#functionaility)  
 [General Process](#general-process)

## Functionaility
    •  Ask a yes/no question, press the button and the app will give you and answer.
    •  This is a simple app with basic UI functionality and interaction.

## General Process
This part introduces the general process of the application development  
1. [Logic and functionailities](#logic-and-functionailities)
2. [Checking and testing](#checking-and-testing)
    
### Logic and functionailities
- The basic logic of the app is as follows:
    •  Create a set of possible answers
	•  On button click, draw one of the answers at random and display it in the UI.

>**Using the Math.random() function**

- Within your business logic:
	After creating a collection (array) of possible answers, use the Math.random() function to draw one of them.

```typescript
	export class Magic8Ball {
		private answersArray = ["It is certain", "It is\ndecidedly so", "Without a doubt", "Yes, definitely", "You may\nrely on it",
			"As I see it,\nyes", "Most likely", "Outlook good", "Yes", "Signs point\nto yes", "Reply hazy,\ntry again", "Ask again later",
			"Better not\ntell you now", "Cannot\npredict now", "Concentrate\nand ask again", "Don’t count\non it", "My reply is no",
			"My sources\nsay no", "Outlook\nnot so good", "Very doubtful"]

		private random(edge: number) : number {
			return Math.floor(Math.random() * edge) ;
		}

		drawAnAnswer(): string{
			return this.answersArray[this.random(this.answersArray.length)];
		}
	}
```
- In your UI class:
	Create an instance of the Magic8Ball class and bind the onClick() method of a button to the drawAnAnswer() method.

```typescript
	private magicBall : Magic8Ball = new Magic8Ball();
	(...)
	
	if (this.isAnswer) {
        Stack({alignContent: Alignment.Center}) {
			Image($r('app.media.8ball_empty'))
				.autoResize(true)
				.height($r('app.string.half_size'))
            Text(this.magicBall.drawAnAnswer())
				.fontSize($r('app.integer.default_font_size'))
				.fontColor(Color.White)
				.textAlign(TextAlign.Center)
			}
        } else {
			Image($r('app.media.8ball'))
				.autoResize(true)
				.height($r('app.string.half_size'))
        }
		
		
	
	(...)
	
	Button($r('app.string.button_label'))
        .type(ButtonType.Capsule)
        .onClick(() => {
			this.isAnswer = !this.isAnswer;
        })
```

> **Note**  
> The `isAnswer` variable has been marked with a `@State` decorator, which causes rebuilding of the whole `build(){}` segment every time `isAnswer` is changed. 


### Checking and Testing
- All functionalities can be tested on the `Previewer` or on an `Emulator`.
