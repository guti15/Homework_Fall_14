// Robert Gutierrez
// Algorithm Homework number 1 
// Fri Sep  5 16:08:41 EDT 2014

// BINARY SEARCH TREE
 

#include <iostream>
using namespace std;


class treeNode{			// TREE NODE
public:
  int value;
  treeNode *Left, *Right;
  treeNode(int) ;  
};


treeNode::treeNode( int num) {	// TREE NODE CONSTRUCT
  value = num;
  Left  = NULL;
  Right = NULL;
}

class BinarySearchTree{		// BINARY SEARCH TREE 
  
private:
  treeNode *root;
  BinarySearchTree Destroy_tree( treeNode );
  void insert_help(int , treeNode *leaf);
  bool search_help(int, treeNode *);
  void inOrder_help(treeNode *); 
  
public:
  BinarySearchTree();
  ~BinarySearchTree ();
  void insert(int);
  void destroy_tree(treeNode *);
  bool  search(int);
  void inOrderTraversal(); 
  
};




void BinarySearchTree::destroy_tree( treeNode *Leaf){ //  DESTROY TREE
  if (Leaf != NULL)
    {
      destroy_tree(Leaf->Left);
      destroy_tree(Leaf->Right);
      destroy_tree(Leaf);
    }
 
 }


void BinarySearchTree::insert_help(int key, treeNode *Leaf ) //  INSERT_HELP
{
  if (key < Leaf->value and Leaf->Left !=NULL ) 
    {  return insert_help(key,Leaf->Left);}
  
  else if (key < Leaf->value and Leaf->Left == NULL)
   {
    Leaf->Left = new treeNode(key);

    }
  
  else if(key >Leaf->value and Leaf->Right != NULL)
    
    { return insert_help(key, Leaf->Right);  }
  
   
  else if (key > Leaf->value and Leaf->Right == NULL)
    {
      Leaf->Right = new treeNode(key);
    
    }
}



void BinarySearchTree::insert(int key){ //  INSERT 
  if(root == NULL)
    {
      root = new treeNode(key);  }
  else { insert_help(key, root); }

}

BinarySearchTree::BinarySearchTree(){ // INITIALIZER 
  root = NULL;
}



BinarySearchTree::~BinarySearchTree(){ // DECONSTRUCTER
 treeNode destroy_tree( treeNode);  

}



bool BinarySearchTree::search_help(int key, treeNode *Leaf){ // SEARCH_HELP
  
  if(Leaf == NULL)
    { return false; }
  
  else if (Leaf->value == key )
    { return true; }

  else if ( key < Leaf->value)
    { return search_help(key, Leaf->Left); }

  else
    {return search_help(key, Leaf->Right); }
      
}



bool BinarySearchTree::search(int key){ // SEARCH (helper) 
  bool BOOL;

  return search_help(key, root);
}
void BinarySearchTree::inOrder_help(treeNode *Leaf){ //  INORDER _ HELP

   if (Leaf != NULL )
    { inOrder_help(Leaf->Left);
      cout << Leaf->value << ' ';
      inOrder_help(Leaf->Right); }
     
  
}
void BinarySearchTree::inOrderTraversal(){ //  INORDER TRAVERSAL
  inOrder_help(root);

} 


int main()			// MAIN 
{
  BinarySearchTree BST; 
  BST =BinarySearchTree() ;
  int HowMany ,number, ask ;
  string t = " was found in the tree! " ; string f = " was not found in tree.. sorry";

  
  cout << "enter numbers to enter in Binary search tree\n"<<
    "to exit simply enter 0 (zero)" << endl;
  
  cin >> ask;
  while(ask != 0 )
    {
      BST.insert(ask);
      cin >> ask;
    }
  
  cout << "you entered 'zero' thank you for your list" <<endl;
   
  cout << "enter a number to search for in Tree, enter '0' to Exit: "<<endl;
  
  cin >> number;
  
  bool temp; 

  while (number != 0)
    {
      temp=  BST.search(number);
      if (temp == true) 
	{cout << number  << t   << endl;}	    

      else{ cout << number << f   << endl;}
      
      cin >>  number;
    }
  cout << "this is the traversal List: "<< endl; BST.inOrderTraversal();

  return 0; 
  }
