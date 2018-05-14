
class Question
{
    constructor( question, weight, answers, correct )
    {
        this.question = question;
        this.weight   = weight;
        this.answers  = answers;
        this.correct  = correct;
    }

    isCompleted()
    {
        if (this.question == "" ||
            !this.answers.every( function( e ) { return e != ""; } ) ||
            this.correct == -1) {
            return false;
        } else {
            return true;
        }
    }
}
