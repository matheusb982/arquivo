#include <GL/glut.h>

GLfloat xf, yf, win;
GLint view_w, view_h;



void Desenha(void)
{
     glMatrixMode(GL_MODELVIEW);
     glLoadIdentity();
     glClear(GL_COLOR_BUFFER_BIT);
     glColor3f(1.0f, 0.0f, 0.0f);
     glBegin(GL_POLYGON);
     glVertex2f(0.0f, 0.0f);
     glVertex2f(xf, 0.0f);
     glColor3f(0.0f, 0.0f, 1.0f);
     glVertex2f(xf, yf);
     glVertex2f(0.0f, yf);
     glEnd();
     glFlush();

}

// Inicializa par�metros de rendering
void Inicializa (void)
{
    // Define a cor de fundo da janela de visualiza��o como preta
    glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
    xf=50.0f;
    yf=50.0f;
    win=250.0f;

}

// Fun��o callback chamada quando o tamanho da janela � alterado
void AlteraTamanhoJanela(GLsizei w, GLsizei h)
{
    // Especifica as dimens�es da Viewport
    glViewport(0, 0, w, h);
    view_w = w;
    view_h = h;

    // Inicializa o sistema de coordenadas
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluOrtho2D (-win, win, -win, win);
    glMatrixMode(GL_MODELVIEW);
}


void GerenciaMouse(int button, int state, int x, int y)
{
    if (button == GLUT_LEFT_BUTTON){
           win -= 20;
           glMatrixMode(GL_PROJECTION);
           glLoadIdentity();
           gluOrtho2D (-win, win, -win, win);

         }

    if(button == GLUT_RIGHT_BUTTON){
           win += 20;
           glMatrixMode(GL_PROJECTION);
           glLoadIdentity();
           gluOrtho2D (-win, win, -win, win);

         }
    glutPostRedisplay();
}
void GerenciaTeclado(unsigned char key, int x, int y)
{
    switch (key) {
            case 'Q':
            case 'q':
            case 27:
              exit(0);
            break;
    }
    glutPostRedisplay();
}

void TeclasEspeciais(int key, int x, int y)
{
    switch(key){
            case GLUT_KEY_LEFT:

            glMatrixMode(GL_PROJECTION);
            glTranslatef(-1, 0, 0);

            break;

            case GLUT_KEY_RIGHT:

            glMatrixMode(GL_PROJECTION);
            glTranslatef(1, 0, 0);

            break;

            case GLUT_KEY_PAGE_UP:

            glMatrixMode(GL_PROJECTION);
            glScalef(2.5f, 2.5f, 1.0f);

            break;

            case GLUT_KEY_HOME:
            win=250.0f;
            glMatrixMode(GL_PROJECTION);
            glLoadIdentity();
            gluOrtho2D (-win, win, -win, win);

            break;

}
    glutPostRedisplay();
}


// Programa Principal
int main(int argc, char*argv[])
{
     glutInit (&argc, argv);
     glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);
     glutInitWindowSize(400,350);
     glutInitWindowPosition(10,10);
     glutCreateWindow("Quadrado");
     glutDisplayFunc(Desenha);
     glutReshapeFunc(AlteraTamanhoJanela);
     Inicializa();
     glutKeyboardFunc(GerenciaTeclado);
     glutMouseFunc(GerenciaMouse);
     glutSpecialFunc(TeclasEspeciais);
     glutMainLoop();
}
