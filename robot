#include <GL/freeglut.h> 

int windowWidth = 700;
int windowHeight = 700;
float cloudx = 0.0;
float leftLegAngle = -20.0;
float rightLegAngle = -20.0;
float rightArmAngle = 0.0;
float leftArmAngle = 89.0;
float headRotAngle = 0.0;

void drawRobot()
{
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	gluPerspective(60.0, 1, 0.3, 152.0);
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();
	gluLookAt(0.0, 0.0, 45.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0);

	//head
	glPushMatrix();
	glTranslatef(0.0, 7.0, 0.0);
	glRotatef(headRotAngle, 0.0, 1.0, 0.0);
	headRotAngle += 0.2;
	glTranslatef(0.0, -7.0, 0.0);
	glColor3f(0.0f, 0.0f, 1.0f);     //blue
	glBegin(GL_POLYGON);
	glVertex2i(-2, 9);
	glVertex2i(-2, 5);
	glVertex2i(2, 5);
	glVertex2i(2, 9);
	glEnd();
	glPopMatrix();

	//body
	glColor3f(1.0f, 1.0f, 0.0f);  //yellow
	glBegin(GL_POLYGON);
	glVertex2i(-4, 5);
	glVertex2i(4, 5);
	glVertex2i(4, -5);
	glVertex2i(-4, -5);
	glEnd();

	//left arm
	glColor3f(254.0f / 255.0f, 111.0f / 255.0f, .0f / 255.0f); //orange
	glPushMatrix();
	glTranslatef(-4.0, 3.0, 0.0);
	glRotatef(leftArmAngle, 0.0, 0.0, -1.0);
	if (leftArmAngle > 0.0) leftArmAngle -= .04;
	else leftArmAngle = 89.0;
	glTranslatef(4.0f, -3.0f, 0.0f);
	glBegin(GL_POLYGON);
	glVertex2i(-11, 5);
	glVertex2i(-4, 5);
	glVertex2i(-4, 2);
	glVertex2i(-11, 2);
	glEnd();
	glPopMatrix();

	//right arm
	glPushMatrix();
	glColor3f(1.0f, 0.0f, 0.0f); //red
	glTranslatef(4.0, 3.0, 0.0);
	glRotatef(rightArmAngle, 0.0, 0.0, 1.0);
	if (rightArmAngle < 89) rightArmAngle += .04;
	else rightArmAngle = 0.0;
	glTranslatef(-4.0f, -3.0f, 0.0f);
	glBegin(GL_POLYGON);
	glVertex2i(4, 5);
	glVertex2i(11, 5);
	glVertex2i(11, 2);
	glVertex2i(4, 2);
	glEnd();
	glPopMatrix();

	//left leg
	glPushMatrix();
	glColor3f(0.0f, 1.0f, 1.0f); //cyan
	glRotatef(leftLegAngle, 1.0, 0.0, 0.0);
	if (leftLegAngle < 30) leftLegAngle += .03;
	else leftLegAngle = -30;
	glBegin(GL_POLYGON);
	glVertex2i(-1, -5);
	glVertex2i(-4, -5);
	glVertex2i(-4, -12);
	glVertex2i(-1, -12);
	glEnd();
	glPopMatrix();

	//right leg
	glPushMatrix();
	glColor3f(7.0f, 0.0f, 0.3f); //pink
	glRotatef(rightLegAngle, -1.0, 0.0, 0.0);
	if (rightLegAngle < 30) rightLegAngle += .03;
	else rightLegAngle = -30;
	glBegin(GL_POLYGON);
	glVertex2i(1, -5);
	glVertex2i(4, -5);
	glVertex2i(4, -12);
	glVertex2i(1, -12);
	glEnd();
	glPopMatrix();

	//cloud
	glTranslatef(cloudx, 0.0f, 0.0f);
	glPushMatrix();
	glColor3f(0.5f, 0.9f, 1.0f);
	glBegin(GL_POLYGON);
	glVertex2i(-30, 17);
	glVertex2i(-30, 20);
	glVertex2i(-22, 20);
	glVertex2i(-22, 17);
	glEnd();

	glColor3f(0.5f, 0.9f, 1.0f);
	glBegin(GL_POLYGON);
	glVertex2i(-28, 20);
	glVertex2i(-28, 23);
	glVertex2i(-20, 23);
	glVertex2i(-20, 20);
	glEnd();

	if (cloudx < 50) cloudx = cloudx + .003;
	else cloudx = 0;
	glPopMatrix();

	glutPostRedisplay();

	glFlush();
}


int main(int argc, char** argv)
{
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);
	glutInitWindowPosition(300, 100);
	glutInitWindowSize(windowWidth, windowHeight);
	int window1 = glutCreateWindow("I  AM  A  R O B O T ?");

	glutDisplayFunc(drawRobot);

	glutMainLoop();
	return -1;
}
